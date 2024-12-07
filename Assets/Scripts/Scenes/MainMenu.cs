using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class MainMenu : MonoBehaviour
{
    public Button continueButton;
    private void Start()
    {
        if (SaveSystem._saveData.InkSaveData.state != "")
        {
            continueButton.interactable = true;
        }
    }
    public void NewGame()
    {
        SaveSystem.Erase();
        SceneManager.LoadScene("CharacterCreation");
    }
    public void Continue()
    {
        SceneManager.LoadScene("Preload");
    }
}
