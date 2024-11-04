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

            if (Data)
            { 
                GetDataFromCollection(); 
            }
        }
    }
    private void Start()
    {
        //Load, then save data at start of level
        SaveSystem.Load();
        SaveSystem.Save();
    }
    void GetDataFromCollection()
    {
        if (GameManager.Instance.SceneCollection)
        {
            SceneData CurrentSceneData = GameManager.Instance.SceneCollection.GetCurrentSceneData();
            LastPlayerPosition = CurrentSceneData.LastPlayerPosition;
        }
    }
    public void UpdateSceneCollection()
    {
        if (GameManager.Instance.Player)
        {
            LastPlayerPosition = GameManager.Instance.Player.transform.position;
        }

        if (Data)
        {
            GameManager.Instance.SceneCollection.SceneDataCollection[Data] = this;
        }
    }
}
