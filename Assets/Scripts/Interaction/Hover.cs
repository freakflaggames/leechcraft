using System.Collections;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using UnityEngine;

public class Hover : MonoBehaviour
{
    [SerializeField] Material baseMat;
    [SerializeField] Material outline;
    [SerializeField] LayerMask layer;

    Material setMat;

    private void Start()
    {
        setMat = GetComponent<Renderer>().material;
    }

    private void OnMouseOver()
    {
        GetComponent<Renderer>().material = outline;
        Debug.Log("mouseover");
    }

    private void OnMouseExit()
    {
        GetComponent<Renderer>().material = baseMat;
        Debug.Log("mouse exit");
    }
}
