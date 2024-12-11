using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class MainMenu : MonoBehaviour
{
    public Button continueButton;
    [SerializeField] GameObject credits;
    bool creditsActive;

    private void Start()
    {
        if (SaveSystem._saveData.InkSaveData.state != "")
        {
            continueButton.interactable = true;
        }

        credits.SetActive(false);
    }

    public void NewGame()
    {
        SaveSystem.EraseDialogue();
        FadeVFX.Instance.Fade(0.5f, 0, 0.5f);
        StartCoroutine(WaitToLoadScene(0.5f, "CharacterCreation"));
    }

    public void Continue()
    {
        FadeVFX.Instance.Fade(0.5f, 0, 0.5f);
        StartCoroutine(WaitToLoadScene(0.5f, "LeechHouse_1"));
        SaveSystem.LoadDialogue();
    }
    public static IEnumerator WaitToLoadScene(float time, string sceneName)
    {
        yield return new WaitForSeconds(time);
        SceneManager.LoadScene(sceneName);
    }

    public void Credits()
    {
        if(!creditsActive)
        {
            credits.SetActive(true);
            creditsActive = true;
        }
        else
        {
            credits.SetActive(false);
            creditsActive = false;
        }
    }

    public void QuitGame()
    {
        Application.Quit();
    }
}
