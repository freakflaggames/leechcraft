using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class InventoryUI : MonoBehaviour
{
    public GameObject itemDisplayPrefab;
    public Inventory inventory;
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

                display.Image.enabled = true;
                display.Image.sprite = slot.item.Icon;
                if (slot.amount > 1)
                {
                    display.AmountText.enabled = true;
                    display.AmountText.text = slot.amount + "";
                }
            }
            else
            {
                display.Image.enabled = false;
                display.AmountText.enabled = false;
            }
        }
    }
}
