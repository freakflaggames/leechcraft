using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;

public class PlayerInput : MonoBehaviour
{
    public Vector3 MoveDirection { get; private set; }

    PlayerInputActions playerControls;
    InputAction move;

    private void Awake()
    {
        playerControls = new PlayerInputActions();
        move = playerControls.Player.Move;
    }
    private void OnEnable()
    {
        move.Enable();
    }
    private void Update()
    {
        MoveDirection = new Vector3(move.ReadValue<Vector2>().x, 0, move.ReadValue<Vector2>().y);
    }
    private void OnDisable()
    {
        move.Disable();
    }
}
