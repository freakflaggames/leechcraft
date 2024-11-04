using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DialogueInteractable : MonoBehaviour, IInteractable
{
    public TextAsset Dialogue;

    public void Interact(InteractionSystem interaction)
    {
        GameManager.Instance.StartDialogue(Dialogue);
    }
}
