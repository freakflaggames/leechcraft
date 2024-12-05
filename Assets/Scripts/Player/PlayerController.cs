using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour
{
    public float MoveSpeed;
    public float TurnSpeed;

    CharacterController controller;
    PlayerInput input;

    public InteractionSystem Interaction;
    public Inventory PlayerInventory;

    public delegate void OnPlayerCollected();
    public static event OnPlayerCollected playerCollected;

    bool loaded;

    private void Awake()
    {
        if (GameManager.Instance)
        {
            GameManager.Instance.Player = this;
        }
        controller = GetComponent<CharacterController>();
        input = GetComponent<PlayerInput>();
    }
    private void Update()
    {
        Look();
        Move();
    }
    void Look()
    {
        if (input.MoveDirection != Vector3.zero)
        {
            //transform input coordinates to isometric direction
            var matrix = Matrix4x4.Rotate(Quaternion.Euler(0,45,0));
            var skewedInput = matrix.MultiplyPoint3x4(input.MoveDirection);
            var relative = (transform.position + skewedInput) - transform.position;
            var rot = Quaternion.LookRotation(relative, Vector3.up);

            //rotate player to where direction is pointing
            transform.rotation = Quaternion.RotateTowards(transform.rotation, rot, TurnSpeed * Time.deltaTime);
        }
    }
    void Move()
    {
        //move player forward if move input is held down
        if (input.MoveDirection.magnitude > 0)
        {
            Vector3 movePos = (transform.forward * (input.MoveDirection.magnitude * MoveSpeed) * Time.deltaTime) + (Vector3.up * Physics.gravity.y * Time.deltaTime);
            controller.Move(movePos);
        }
    }
    void Interact()
    {
        Interaction.Interact();
    }
    private void OnTriggerEnter(Collider other)
    {
        var nearbyInteractable = other.gameObject.GetComponent<IInteractable>();
        if (nearbyInteractable != null)
        {
            Interaction.Interactable = nearbyInteractable;
        }
    }
    private void OnTriggerExit(Collider other)
    {
        if (Interaction.Interactable != null)
        {
            Interaction.ClearInteractable();
        }
    }
    private void OnEnable()
    {
        PlayerInput.playerInteracted += Interact;
    }
    private void OnDisable()
    {
        PlayerInput.playerInteracted -= Interact;
    }
    public void Save(ref PlayerSaveData data)
    {
        data.Items = PlayerInventory.ItemSlots;
    }
    public void Load(PlayerSaveData data)
    {
        SceneData CurrentSceneData = GameManager.Instance.SceneCollection.GetCurrentSceneData();

        if (CurrentSceneData.LastPlayerPosition != Vector3.zero)
        {
            transform.position = CurrentSceneData.LastPlayerPosition;
        }

        PlayerInventory.ItemSlots = data.Items;
    }
}

[System.Serializable]
public struct PlayerSaveData
{
    public List<InventorySlot> Items;
}
