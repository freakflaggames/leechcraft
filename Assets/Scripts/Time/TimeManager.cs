using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TimeManager : MonoBehaviour
{
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
        TimeUI.Instance.UpdateUI(DayIndex, DayStates.Count);
    }
}
