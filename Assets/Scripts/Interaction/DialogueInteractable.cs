using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DialogueInteractable : MonoBehaviour, IInteractable
{
    public string Knot;

    public void Interact(InteractionSystem interaction)
    {
        GameManager.Instance.StartDialogue(Knot);
    }
}