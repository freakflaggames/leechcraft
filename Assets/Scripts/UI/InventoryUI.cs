using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class InventoryUI : MonoBehaviour
{
    public GameObject itemDisplayPrefab;
    public InventoryObject inventory;
    public List<ItemDisplayUI> ItemDisplays;
    private void Awake()
    {
        for (int i = 0; i < inventory.MaxSlots; i++)
        {
            ItemDisplayUI display = Instantiate(itemDisplayPrefab, transform).GetComponent<ItemDisplayUI>();
            ItemDisplays.Add(display);
        }

        UpdateUI();
    }
    public void UpdateUI()
    {
        for (int i = 0; i < ItemDisplays.Count; i++)
        {
            ItemDisplayUI display = ItemDisplays[i];

            if (i < inventory.ItemSlots.Count)
            {
                InventorySlot slot = inventory.ItemSlots[i];

                display.image.enabled = true;
                display.image.sprite = slot.item.Icon;
                if (slot.amount > 1)
                {
                    display.amountText.enabled = true;
                    display.amountText.text = slot.amount + "";
                }
            }
            else
            {
                display.image.enabled = false;
                display.amountText.enabled = false;
            }
        }
    }
}
