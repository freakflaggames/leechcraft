using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using DG.Tweening;

public class InkFade : MonoBehaviour
{
    public Image FadeImage;

    // In this case, fading IN refers to fading into black and fading OUT refers to fading out of black

    public void FadeOut(float fadeInTime, float holdTime, float fadeOutTime)
    {
        print("fade out");
        StartCoroutine(FadeOutCoroutine(fadeInTime, holdTime, fadeOutTime));
    }

    public IEnumerator FadeOutCoroutine(float fadeInTime, float holdTime, float fadeOutTime)
    {
        FadeImage.DOColor(Color.black, fadeInTime);

        yield return new WaitForSeconds(fadeInTime);

        yield return new WaitForSeconds(holdTime);

        FadeImage.DOColor(new Color(0,0,0,0), fadeOutTime);

        yield return new WaitForSeconds(fadeOutTime);

        FadeImage.gameObject.SetActive(false);
    }

    public void FadeIn(float fadeInTime, float holdTime, float fadeOutTime)
    {
        StartCoroutine(FadeInCoroutine(fadeInTime, holdTime, fadeOutTime));
    }

    public IEnumerator FadeInCoroutine(float fadeInTime, float holdTime, float fadeOutTime)
    {
        FadeImage.gameObject.SetActive(true);

        FadeImage.DOColor(new Color(0,0,0,0), fadeInTime);

        yield return new WaitForSeconds(fadeInTime);

        yield return new WaitForSeconds(holdTime);

        FadeImage.DOColor(Color.black, fadeOutTime);

        yield return new WaitForSeconds(fadeOutTime);
    }
    
}
