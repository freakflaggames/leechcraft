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
        SaveSystem.Save();
        if (GameManager.Instance.SceneCollection.SceneIDToIndexMap.TryGetValue(savedSceneID, out int sceneIndex))
        {
            SceneManager.LoadScene(sceneIndex);
        }
    }
}
