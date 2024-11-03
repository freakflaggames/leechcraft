using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SceneCollection : MonoBehaviour
{
    [SerializeField] public SceneDataSO[] Scenes;
    public Dictionary<string, int> SceneIDToIndexMap = new Dictionary<string, int>();
    public Dictionary<SceneDataSO, SceneData> SceneDataCollection = new Dictionary<SceneDataSO, SceneData>();
    private void Awake()
    {
        GameManager.Instance.SceneCollection = this;
        DontDestroyOnLoad(gameObject);
        PopulateSceneMappings();
    }
    void PopulateSceneMappings()
    {
        foreach (var sceneDataSO in Scenes)
        {
            SceneIDToIndexMap[sceneDataSO.Name] = sceneDataSO.SceneIndex;
        }
        for (int i = 0; i < Scenes.Length; i++)
        {
            SceneDataCollection.Add(Scenes[i], new SceneData());
        }
    }
    public SceneData GetCurrentSceneData()
    {
        return SceneDataCollection[GameManager.Instance.SceneData.Data];
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