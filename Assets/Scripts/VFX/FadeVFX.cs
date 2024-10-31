using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using DG.Tweening;

public class FadeVFX : MonoBehaviour
{
    public static FadeVFX Instance;
    public Image FadeImage;

    private void Awake()
    {
        Instance = this;
    }

    public void Fade(float fadeInTime, float holdTime, float fadeOutTime)
    {
        StartCoroutine(FadeCoroutine(fadeInTime, holdTime, fadeOutTime));
    }

    public IEnumerator FadeCoroutine(float fadeInTime, float holdTime, float fadeOutTime)
    {
        FadeImage.DOColor(Color.black, fadeInTime);

        yield return new WaitForSeconds(fadeInTime);

        yield return new WaitForSeconds(holdTime);

        FadeImage.DOColor(new Color(0,0,0,0), fadeInTime);

        yield return new WaitForSeconds(fadeOutTime);
    }
}
