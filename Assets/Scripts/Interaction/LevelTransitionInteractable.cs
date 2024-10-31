using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class LevelTransitionInteractable : MonoBehaviour, IInteractable
{
    public SceneDataSO Scene;
    public void Interact(InteractionSystem interaction)
    {
        GameManager.Instance.SceneLoader.LoadSceneByIndex(Scene.Name);
    }
}
