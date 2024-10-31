using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using System.Threading.Tasks;

public class SceneLoader : MonoBehaviour
{

    private void Awake()
    {
        GameManager.Instance.SceneLoader = this;
    }

    public void LoadSceneByIndex(string savedSceneID)
    {
        if (GameManager.Instance.SceneCollection.SceneIDToIndexMap.TryGetValue(savedSceneID, out int sceneIndex))
        {
            SceneManager.LoadScene(sceneIndex);
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
            LoadSceneByIndex(data.LastSceneID);
        }
    }
}

[System.Serializable]
public struct SceneSaveData
{
    public string LastSceneID;
}
