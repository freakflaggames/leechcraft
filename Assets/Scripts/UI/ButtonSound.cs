using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.UI;

public class ButtonSound : MonoBehaviour
{
    Button button;
    AudioSource audioSource;
    [SerializeField] AudioClip buttonHover, buttonClick;

    void Start()
    {
        audioSource = gameObject.GetComponent<AudioSource>();
        button = gameObject.GetComponent<Button>();
    }

    public void ButtonHover()
    {
        if(button.interactable)
            audioSource.PlayOneShot(buttonHover);
    }

    public void ButtonClick()
    {
        audioSource.PlayOneShot(buttonClick);
    }
}
