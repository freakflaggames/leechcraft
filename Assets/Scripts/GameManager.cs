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
    private void Awake()
    {
        Instance = this;
        DontDestroyOnLoad(gameObject);
    }
    private void Start()
    {
        SaveSystem.Save();
        SaveSystem.Load();
    }
    public void StartDialogue(string knotName)
    {
        InkController.gameObject.SetActive(true);
        InkController.knot = knotName;
        InkController.RemoveChildren();
        InkController.StartStory();
    }
}
