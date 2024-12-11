using System.Collections;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using UnityEngine;

public class Hover : MonoBehaviour
{
    [SerializeField] Material baseMat, outline;
    [SerializeField] Renderer targetObject;
    [SerializeField] List<Renderer> targets = new List<Renderer>();
    [SerializeField] bool Multiples = false;
    [SerializeField] float newWeight;


    private void Update()
    {
        if (Input.GetKey(KeyCode.LeftShift))
        {
            outline.SetFloat("_Weight", 0);
            targetObject.material = outline;
        }
        else
           targetObject.material = baseMat;
    }

    private void OnMouseOver()
    {
        if(!Multiples && targetObject != null)
        {
            outline.SetFloat("_Weight", newWeight);
            targetObject.material = outline;
        }
        else
        {
            foreach(var target in targets)
            {
                outline.SetFloat("_Weight", newWeight);
                target.material = outline;
            }
        }

    }

    private void OnMouseExit()
    {
        if (!Multiples && targetObject != null)
        {
            targetObject.material = baseMat;
        }
        else
        {
            foreach (var target in targets)
            {
                target.material = baseMat;
            }
        }
    }
}
