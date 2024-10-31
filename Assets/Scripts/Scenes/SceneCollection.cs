using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SceneCollection : MonoBehaviour
{
    [SerializeField] public SceneDataSO[] SceneDataSOArray;
    public Dictionary<string, int> SceneIDToIndexMap = new Dictionary<string, int>();
    private void Awake()
    {
        GameManager.Instance.SceneCollection = this;
        DontDestroyOnLoad(gameObject);
        PopulateSceneMappings();
    }
    void PopulateSceneMappings()
    {
        foreach (var sceneDataSO in SceneDataSOArray)
        {
            SceneIDToIndexMap[sceneDataSO.Name] = sceneDataSO.SceneIndex;
        }
    }
    public void Save(ref SceneSaveData data)
    {
        if (GameManager.Instance.SceneData.Data)
        {
            data.LastSceneID = GameManager.Instance.SceneData.Data.Name;
        }
    }
    public void Load(SceneSaveData data)
    {
        if (!GameManager.Instance.SceneData.Data)
        {
            if (data.LastSceneID == null)
            {
                data.LastSceneID = "Leech House";
            }
            GameManager.Instance.SceneLoader.LoadSceneByIndex(data.LastSceneID);
        }
    }
}
[System.Serializable]
public struct SceneSaveData
{
    public string LastSceneID;
}