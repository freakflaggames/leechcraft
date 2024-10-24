using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerInteraction : MonoBehaviour
{
    public InventoryObject PlayerInventory;
    public IInteractable interactable;

    public delegate void OnPlayerCollected();
    public static event OnPlayerCollected playerCollected;

    private void OnEnable()
    {
        PlayerInput.playerInteracted += Interact;
    }
    private void OnDisable()
    {
        PlayerInput.playerInteracted -= Interact;
    }
    public void Interact()
    {
        if (interactable != null)
        {
            interactable.Interact(this);
        }
    }
    public void ClearInteractable()
    {
        interactable = null;
    }
    private void OnTriggerEnter(Collider other)
    {
        var nearbyInteractable = other.gameObject.GetComponent<IInteractable>();
        if (nearbyInteractable != null)
        {
            interactable = nearbyInteractable;
        }
    }
    private void OnTriggerExit(Collider other)
    {
        ClearInteractable();
    }
}
