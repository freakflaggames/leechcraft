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
}
