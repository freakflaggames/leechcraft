using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "New Inventory", menuName = "Inventory System/Inventory")]
public class InventoryObject : ScriptableObject
{
    public int MaxSlots;
    public List<InventorySlot> ItemSlots = new List<InventorySlot>();
    public bool AddItem(ItemObject _item, int _amount)
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
        return true;
    }
}

[System.Serializable]
public class InventorySlot
{
    public ItemObject item;
    public int amount;
    public InventorySlot(ItemObject _item, int _amount)
    {
        item = _item;
        amount = _amount;
    }
    public void AddAmount(int value)
    {
        amount += value;
    }
}

