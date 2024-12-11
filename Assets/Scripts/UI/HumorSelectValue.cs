using System.Collections;
using System.Collections.Generic;
using TMPro;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.UI;

public class HumorSelectValue : MonoBehaviour
{
    [SerializeField] HumorPoints hp;
    public int humor;
    public GameObject increaseButtonObj, decreaseButtonObj, humorTextObj;
    [SerializeField] GameObject bonusText;
    Button increaseButton, decreaseButton;
    public bool bgBonus;
    TextMeshProUGUI humorText;

    void Start()
    {
        humorText = humorTextObj.GetComponent<TextMeshProUGUI>();
        increaseButton = increaseButtonObj.GetComponent<Button>();
        decreaseButton = decreaseButtonObj.GetComponent<Button>();

        decreaseButton.interactable = false;
    }

    public void IncreaseHumor()
    {
        hp.HumorPoint(true);

        decreaseButton.interactable = true;

        if(humor < 2)
        {
            humor++;
            humorText.text = humor.ToString();
            if(humor > 1)
                increaseButton.interactable = false;
        }
    }

     public void DecreaseHumor()
    {
        hp.HumorPoint(false);

        increaseButton.interactable = true;

        if(humor > 0 && !bgBonus)
        {
            humor--;
            humorText.text = humor.ToString();
            if (humor < 1)
                decreaseButton.interactable = false;
        }
        else if (humor > 1 && bgBonus)
        {
            humor--;
            humorText.text = humor.ToString();
            if (humor < 2)
                decreaseButton.interactable = false;
        }
    }

    public void EnableBGBonus()
    {
        bgBonus = true;
        humor++;
        humorText.text = humor.ToString();
        bonusText.SetActive(true);
        if(humor > 1)
            increaseButton.interactable = false;
    }

    public void DisableBGBonus()
    {
        bgBonus = false;
        bonusText.SetActive(false);

        if(humor > 0)
        {
            humor--;
            humorText.text = humor.ToString();
            if (humor < 1)
                decreaseButton.interactable = false;
        }
    }

    public void InteractableOverride(bool on)
    {
        if (on)
            increaseButton.interactable = false;
        else
            increaseButton.interactable = true; 
    }

    public void ResetHumor()
    {
        DisableBGBonus();
        hp.ResetHumorPoints();
        humor = 0;
        humorText.text = humor.ToString();
        InteractableOverride(false);
        decreaseButton.interactable = false;
    }
}
