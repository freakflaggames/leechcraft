using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class OpeningDialogue : MonoBehaviour
{

    [SerializeField] string Knot;

    // Start is called before the first frame update
    void Start()
    {
        GameManager.Instance.StartDialogue(Knot);
    }
}
