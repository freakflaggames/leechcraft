using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

public class TimeManager : MonoBehaviour
{
    public Transform sunVFX;
    public static TimeManager Instance;
    public List<DayState> DayStates;
    public DayState CurrentState;
    public int DayIndex;

    private void Awake()
    {
        Instance = this;
    }
    public void AdvanceDay(int amount)
    {
        DayIndex += amount;
        DayIndex %= DayStates.Count;
        CurrentState = DayStates[DayIndex];
    }
}
