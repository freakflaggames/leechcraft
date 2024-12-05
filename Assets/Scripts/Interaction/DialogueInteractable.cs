using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DialogueInteractable : MonoBehaviour, IInteractable
{
    public bool Repeatable;
    public bool Interacted;
    public string Knot;

    public void Interact(InteractionSystem interaction)
    {
        if (!Interacted && !Repeatable || Repeatable)
        {
            GameManager.Instance.StartDialogue(Knot);
            Interacted = true;
        }
    }
}