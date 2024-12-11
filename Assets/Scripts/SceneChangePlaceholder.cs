using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class SceneChangePlaceholder : MonoBehaviour
{
    private void OnTriggerEnter(Collider other)
    {
        if (other.tag == "Player" && (int)GameManager.Instance.InkController.story.variablesState["10106I_stock"] == 5)
            SceneManager.LoadScene("VillageTest");
    }
}