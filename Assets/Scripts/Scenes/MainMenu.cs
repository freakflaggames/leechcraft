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
        FadeVFX.Instance.Fade(0.5f, 0, 0.5f);
        StartCoroutine(WaitToLoadScene(0.5f, "CharacterCreation"));
    }
    public void Continue()
    {
        FadeVFX.Instance.Fade(0.5f, 0, 0.5f);
        StartCoroutine(WaitToLoadScene(0.5f, "Preload"));
    }
    public static IEnumerator WaitToLoadScene(float time, string sceneName)
    {
        yield return new WaitForSeconds(time);
        SceneManager.LoadScene(sceneName);
    }
}
