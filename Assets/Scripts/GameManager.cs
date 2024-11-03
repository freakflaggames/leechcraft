using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;


public class GameManager : MonoBehaviour
{
    public SceneCollection SceneCollection;
    public SceneData SceneData;
    public SceneLoader SceneLoader;
    public static GameManager Instance;
    public PlayerController Player;
    public Vector3 LastPlayerPosition;
    private void Awake()
    {
        Instance = this;
        DontDestroyOnLoad(gameObject);
    }
    private void Start()
    {
        SaveSystem.Load();
    }
}
