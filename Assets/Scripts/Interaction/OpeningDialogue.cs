using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class OpeningDialogue : MonoBehaviour
{

    [SerializeField] string Knot;

    // Start is called before the first frame update
    void Start()
    {
        if (GameManager.Instance.InkController.story.state.VisitCountAtPathString(Knot) < 1)
        {
            GameManager.Instance.StartDialogue(Knot);
        }
    }
}
