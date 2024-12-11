using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;


public class GameManager : MonoBehaviour
{
    public static GameManager Instance;
    public SceneCollection SceneCollection;
    public SceneData SceneData;
    public SceneLoader SceneLoader;
    public PlayerController Player;
    public InkController InkController;
    public GameObject PauseMenu;
    public bool paused;
    public bool dialogue;
    private void Awake()
    {
        Instance = this;
        DontDestroyOnLoad(gameObject);
    }
    private void Start()
    {
        //SceneManager.LoadScene("LeechHouse_1");
        //SaveSystem.Load();
    }
    private void Update()
    {
        if (Input.GetKeyDown(KeyCode.Escape))
        {
            PauseResume();
        }
    }
    public void StartDialogue(string knotName)
    {
        InkController.gameObject.SetActive(true);
        InkController.knot = knotName;
        InkController.RemoveChildren();
        InkController.StartStory();
    }
    public void PauseResume()
    {
        if(!paused)
        {
            PauseMenu.SetActive(true);
            paused = true;
            Time.timeScale = 0;
        }
        else
        {
            PauseMenu.SetActive(false);
            paused = false;
            Time.timeScale = 1;
        }
    }

    public void QuitToMenu()
    {
        PauseMenu.SetActive(false);
        SceneManager.LoadScene("MainMenu");
        Destroy(FadeVFX.Instance.gameObject);
        Destroy(gameObject);
    }
}
