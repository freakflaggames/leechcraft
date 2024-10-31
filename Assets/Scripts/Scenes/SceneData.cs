using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using System.Threading.Tasks;

public class SceneData : MonoBehaviour
{
    public Vector3 LastPlayerPosition;
    public SceneDataSO Data;
    private void Awake()
    {
        if (!GameManager.Instance)
        {
            //if no gamemanager go to preload scene
            SceneManager.LoadScene(0);
        }
        else
        {
            GameManager.Instance.SceneData = this;
        }
    }
    private void Start()
    {
        //Load, then save data at start of level
        SaveSystem.Load();
        SaveSystem.Save();
    }
}
