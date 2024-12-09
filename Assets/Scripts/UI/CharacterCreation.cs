using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class CharacterCreation : MonoBehaviour
{
    [SerializeField] GameObject backgroundSelect, humorSelect;
    [SerializeField] GameObject physicianCard, apothecaryCard, barberCard, charlatanCard;
    [SerializeField] HumorSelectValue bloodBGBonus, yellowBileBGBonus, blackBileBGBonus, phlegmBGBonus;
    public bool physician, apothecary, barber, charlatan;
    public int bloodValue, yellowBileValue, blackBileValue, phlegmValue;

    public void Start()
    {
        backgroundSelect.SetActive(true);
        //humorSelect.SetActive(false);
    }

    public void BackgroundSet(string backgroundSelected)
    {
        ResetBG();

        // Set variable
        if (backgroundSelected == "physician")
        {
            physician = true;
            phlegmBGBonus.EnableBGBonus();
            physicianCard.SetActive(true);
        }
        else if (backgroundSelected == "apothecary")
        {
            apothecary = true;
            blackBileBGBonus.EnableBGBonus();
            apothecaryCard.SetActive(true);
        }
        else if (backgroundSelected == "barber")
        {
            barber = true;
            bloodBGBonus.EnableBGBonus();
            barberCard.SetActive(true);
        }
        else if (backgroundSelected == "charlatan")
        {
            charlatan = true;
            yellowBileBGBonus.EnableBGBonus();
            charlatanCard.SetActive(true);
        }
    }

    public void ResetBG()
    {
        physician = false;
        apothecary = false;
        barber = false;
        charlatan = false;

        phlegmBGBonus.bgBonus = false;
        blackBileBGBonus.bgBonus = false;
        bloodBGBonus.bgBonus = false;
        yellowBileBGBonus.bgBonus = false;

        physicianCard.SetActive(false);
        apothecaryCard.SetActive(false);
        barberCard.SetActive(false);
        charlatanCard.SetActive(false);

        //resets humor point values & BG bonus
        bloodBGBonus.ResetHumor();
        yellowBileBGBonus.ResetHumor();
        blackBileBGBonus.ResetHumor();
        phlegmBGBonus.ResetHumor();
    }

    public void Next(int page)
    {
        if (page == 0)
        {
            backgroundSelect.SetActive(false);
            humorSelect.SetActive(true);
        }
        else if (page == 1)
        {
            StartCoroutine(MainMenu.WaitToLoadScene(0.5f, "LeechHouse_1"));
            FadeVFX.Instance.Fade(0.5f, 0, 0.5f);
            //humorSelect.SetActive(false);
            //confirmationscreen active
        }
    }

    public void Back(int page)
    {
        if (page == 0)
        {
            StartCoroutine(MainMenu.WaitToLoadScene(0.5f, "MainMenu"));
            FadeVFX.Instance.Fade(0.5f, 0, 0.5f);
            //to title screen
        }
        else if (page == 1)
        {
            backgroundSelect.SetActive(true);
            humorSelect.SetActive(false);
        }
    }
}
