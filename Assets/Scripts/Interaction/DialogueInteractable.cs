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
    public bool[] Interactable;

    private void Start()
    {
        int index = 0;
        while (index < Knot.Length)
        {
            if (GameManager.Instance.InkController.story.state.VisitCountAtPathString(Knot[index]) > 0)
            {
                Interacted[index] = true;
                if(!Repeatable[index])
                    Interactable[index] = false;
            }
            index++;
        }
    }
    
    public void Interact(InteractionSystem interaction)
    {
        int index = 0;

        if(Knot.Length == 1 && !Repeatable[0] && Interacted[0])
        {
            Interactable[0] = false;
        }

        while (!Interactable[index] && index <= Knot.Length - 2)
        {
            index++;
        }
        if (index <  Knot.Length)
        {
            if(Interactable[index])
            {
                GameManager.Instance.StartDialogue(Knot[index]);
                Interacted[index] = true;

                if(!Repeatable[index])
                    Interactable[index] = false;
            }
        }
        else
        {
            print("no more content!");
        }
    }
}