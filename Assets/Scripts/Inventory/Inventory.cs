using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Inventory : MonoBehaviour
{
    public int MaxSlots;
    public List<InventorySlot> ItemSlots = new List<InventorySlot>();
    public bool AddItem(Item _item, int _amount)
    {
        //if you're adding an item that you already have, instead increase the amount of that item
        bool hasItem = false;
        for (int i = 0; i < ItemSlots.Count; i++)
        {
            if (ItemSlots[i].item == _item)
            {
                if (_item.Stackable)
                {
                    ItemSlots[i].AddAmount(_amount);
                    hasItem = true;
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }
        if (!hasItem)
        {
            //dont pick up an item if your inventory is full
            if (ItemSlots.Count > MaxSlots-1)
            {
                return false;
            }
            else
            {
                ItemSlots.Add(new InventorySlot(_item, _amount));
            }
        }

        //If you collected an item, save
        SaveSystem.Save();
        return true;
    }
}

[System.Serializable]
public class InventorySlot
{
    public Item item;
    public int amount;
    public InventorySlot(Item _item, int _amount)
    {
        item = _item;
        amount = _amount;
    }
    public void AddAmount(int value)
    {
        amount += value;
    }
}

