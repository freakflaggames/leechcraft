using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerCollection : MonoBehaviour
{
    public InventoryObject PlayerInventory;
    GameObject nearbyItem;

    public delegate void OnPlayerCollected();
    public static event OnPlayerCollected playerCollected;

    private void OnEnable()
    {
        PlayerInput.playerInteracted += PickupItem;
    }
    private void OnDisable()
    {
        PlayerInput.playerInteracted -= PickupItem;
    }
    public void PickupItem()
    {
        if (nearbyItem)
        {
            var itemObject = nearbyItem.GetComponent<Item>();
            //if the item was added, destroy the object and signal to other scripts that collection has occurred
            if (PlayerInventory.AddItem(itemObject.item, 1))
            {
                playerCollected?.Invoke();
                Destroy(nearbyItem);
            }
            nearbyItem = null;
        }
    }
    private void OnTriggerEnter(Collider other)
    {
        Item itemObject = other.gameObject.GetComponent<Item>();
        if (itemObject)
        {
            nearbyItem = other.gameObject;
        }
    }
    private void OnTriggerExit(Collider other)
    {
        Item itemObject = other.gameObject.GetComponent<Item>();
        if (itemObject)
        {
            nearbyItem = other.gameObject;
        }
    }
}
