using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class HumorPoints : MonoBehaviour
{
    [SerializeField] HumorSelectValue blood, yellowBile, blackBile, phlegm;
    [SerializeField] GameObject pointOne, pointTwo, pointThree;
    int currentHumorPoints;

    public void ResetHumorPoints()
    {
        currentHumorPoints = 0;
        UpdatePointUI();
    }

    public void HumorPoint(bool increase)
    {
        if(increase)
        {
            if (currentHumorPoints < 2)
                currentHumorPoints++;
            else
            {
                if (currentHumorPoints == 2)
                   currentHumorPoints++;
                blood.InteractableOverride(true);
                yellowBile.InteractableOverride(true);
                blackBile.InteractableOverride(true);
                phlegm.InteractableOverride(true);
            }
        }
        else
        {
            if (currentHumorPoints > 0)
            {
                currentHumorPoints--;

                blood.InteractableOverride(false);
                yellowBile.InteractableOverride(false);
                blackBile.InteractableOverride(false);
                phlegm.InteractableOverride(false);
            }
            else
            {
                //nothing
            }
        }

        UpdatePointUI();

    }

    void UpdatePointUI()
    {
        if (currentHumorPoints == 0)
        {
            pointOne.SetActive(false);
            pointTwo.SetActive(false);
            pointThree.SetActive(false);
        }
        else if (currentHumorPoints == 1)
        {
            pointOne.SetActive(true);
            pointTwo.SetActive(false);
            pointThree.SetActive(false);
        }
        else if (currentHumorPoints == 2)
        {
            pointOne.SetActive(true);
            pointTwo.SetActive(true);
            pointThree.SetActive(false);
        }
        else if (currentHumorPoints == 3)
        {
            pointOne.SetActive(true);
            pointTwo.SetActive(true);
            pointThree.SetActive(true);
        }
    }
}
