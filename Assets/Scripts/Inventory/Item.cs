using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class Item : MonoBehaviour
{
    public bool Stackable;
    public Sprite Icon;
    [TextArea(15, 20)]
    public string Description;
}
