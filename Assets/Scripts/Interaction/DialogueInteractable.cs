using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DialogueInteractable : MonoBehaviour, IInteractable
{
    public string TriggerVariable;
    public bool Repeatable;
    public bool Interacted;
    public string Knot;

    private void Start()
    {
        if (TriggerVariable != "")
        {
            bool state = (bool)GameManager.Instance.InkController.story.variablesState[TriggerVariable];
            print(state);
            Interacted = state;
        }
    }
    public void Interact(InteractionSystem interaction)
    {
        if (!Interacted && !Repeatable || Repeatable)
        {
            GameManager.Instance.StartDialogue(Knot);
            Interacted = true;
        }
    }
}