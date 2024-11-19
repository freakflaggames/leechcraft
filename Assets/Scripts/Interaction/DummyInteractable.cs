using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class DummyInteractable : MonoBehaviour, IInteractable
{
    public UnityEvent OnInteracted;

    public void Interact(InteractionSystem interaction)
    {
        OnInteracted.Invoke();
    }
}
