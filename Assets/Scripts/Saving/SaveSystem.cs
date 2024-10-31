using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.IO;
using System.Threading.Tasks;

public class SaveSystem
{
    private static SaveData _saveData = new SaveData();

    [System.Serializable]
    public struct SaveData
    {
        public PlayerSaveData PlayerData;
        public SceneSaveData SceneSaveData;
    }
    public static string SaveFileName()
    {
        string saveFile = Application.persistentDataPath + "/save" + ".save";
        return saveFile;
    }
    public static void Save()
    {
        HandleSaveData();
        File.WriteAllText(SaveFileName(), JsonUtility.ToJson(_saveData, true));
    }

    private static void HandleSaveData()
    {
        if (GameManager.Instance.Player)
        {
            GameManager.Instance.Player.Save(ref _saveData.PlayerData);
        }

        GameManager.Instance.SceneCollection.Save(ref _saveData.SceneSaveData);
    }

    public static void Load()
    {
        string saveContent = File.ReadAllText(SaveFileName());

        _saveData = JsonUtility.FromJson<SaveData>(saveContent);
        HandleLoadData();
    }

    public static void HandleLoadData()
    {
        if (GameManager.Instance.Player)
        {
            GameManager.Instance.Player.Load(_saveData.PlayerData);
        }

        if (GameManager.Instance.SceneCollection)
        {
            GameManager.Instance.SceneCollection.Load(_saveData.SceneSaveData);
        }
    }
}
