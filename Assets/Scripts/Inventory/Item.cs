using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public abstract class ItemObject : ScriptableObject
{
    public bool Stackable;
    public Sprite Icon;
    [TextArea(15, 20)]
    public string Description;
}
[CreateAssetMenu(fileName = "New Item", menuName = "Inventory System/Item")]
public class DefaultItemObject : ItemObject
{
    
}
public class Item : MonoBehaviour
{
    public ItemObject item;
}
