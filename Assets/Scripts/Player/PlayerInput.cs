using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;

public class PlayerInput : MonoBehaviour
{
    public Vector3 MoveDirection { get; private set; }

    PlayerInputActions playerControls;

    InputAction move, interact;

    public delegate void OnPlayerInteract();
    public static event OnPlayerInteract playerInteracted;

    private void Awake()
    {
        playerControls = new PlayerInputActions();

        move = playerControls.Player.Move;
        interact = playerControls.Player.Interact;
    }
    private void OnEnable()
    {
        move.Enable();
        interact.Enable();

        interact.performed += Interact;
    }
    void Interact(InputAction.CallbackContext context)
    {
        //signal to all other scripts that player has pressed "interact" button
        playerInteracted?.Invoke();
    }
    private void Update()
    {
        MoveDirection = new Vector3(move.ReadValue<Vector2>().x, 0, move.ReadValue<Vector2>().y);
    }
    private void OnDisable()
    {
        move.Disable();
        interact.Disable();
    }
}
