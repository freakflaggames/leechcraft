using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TimeUI : MonoBehaviour
{
    public Transform ClockHand;
    public static TimeUI Instance;
    private void Awake()
    {
        Instance = this;
    }

    public void UpdateUI(int dayIndex, int dayStates)
    {
        float angle = dayIndex / (float)dayStates * 360;
        ClockHand.transform.localRotation = Quaternion.AngleAxis(angle, Vector3.back);
    }
}
