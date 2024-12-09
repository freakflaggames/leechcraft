using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using Ink.Runtime;
using Unity.VisualScripting.ReorderableList.Element_Adder_Menu;
using UnityEngine;

public class DialogueInteractable : MonoBehaviour, IInteractable
{
    public string[] Knot;
    public bool[] Repeatable;
    public bool[] Interacted;
    private void Start()
    {
        int index = 0;
        while (index < Knot.Length)
        {
            if (GameManager.Instance.InkController.story.state.VisitCountAtPathString(Knot[index]) > 0)
            {
                Interacted[index] = true;
            }
            index++;
        }
    }
    
    public void Interact(InteractionSystem interaction)
    {
        int index = 0;
        while (Interacted[index] && !Repeatable[index] && (index < Knot.Length))
        {
            index++;
        }
        if (index < Knot.Length || Knot.Length == 0)
        {
            GameManager.Instance.StartDialogue(Knot[index]);
            Interacted[index] = true;
        }
        else
        {
            print("no more content!");
        }
    }
}