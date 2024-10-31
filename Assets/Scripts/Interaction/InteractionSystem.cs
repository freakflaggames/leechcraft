using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class InteractionSystem : MonoBehaviour
{
    public IInteractable Interactable;
    public void Interact()
    {
        if (Interactable != null)
        {
            Interactable.Interact(this);
        }
    }

    public void ClearInteractable()
    {
        Interactable = null;
    }
}
