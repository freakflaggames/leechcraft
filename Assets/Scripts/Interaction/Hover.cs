using System.Collections;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using UnityEngine;

public class Hover : MonoBehaviour
{
    [SerializeField] Material baseMat, outline;
    [SerializeField] Renderer targetObject;
    [SerializeField] bool multiple = false;
    [SerializeField] List<Renderer> targets = new List<Renderer>();
    [SerializeField] float newWeight;

    private void OnMouseOver()
    {
        if (targetObject != null && !multiple)
        {
            outline.SetFloat("_Weight", newWeight);
            targetObject.material = outline;
        }
        else
        {
            foreach (Renderer r in targets)
            {
                outline.SetFloat("_Weight", newWeight);
                r.material = outline;
            }
        }

    }

    private void OnMouseExit()
    {
        if (targetObject != null && !multiple)
        {
            targetObject.material = baseMat;
        }
        else
        {
            foreach (Renderer r in targets)
            {
                r.material = baseMat;
            }
        }

    }
}
