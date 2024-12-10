using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class QuestSummary : MonoBehaviour
{
    public static QuestSummary Instance;
    public GameObject[] Objective;
    public GameObject[] Complete;
    //just for now:
    public GameObject[] StockItem;
    public GameObject[] Remedy;
    public GameObject Adda, Everich;

    // 0 = Examine; 1 = Everich; 2 = Remedies; 3 = Heal; 4 = Stock; 5 = Village

    void Awake()
    {
        Instance = this;
    }

    // Start is called before the first frame update
    void Start()
    {
        UpdateQuestSummary();
    }

    public void UpdateQuestSummary()
    {
        int prereq = 0;

        if ((bool)GameManager.Instance.InkController.story.variablesState["10102I_arms"])
        {
            Complete[0].SetActive(true);
            prereq++;
        }

        if ((bool)GameManager.Instance.InkController.story.variablesState["10103C_questions"])
        {
            Complete[1].SetActive(true);
            prereq++;
        }

        if((int)GameManager.Instance.InkController.story.variablesState["totalRemedies"] > 0)
        {
            Complete[2].SetActive(true);
            prereq++;
            // No matter what order you do the objectives in, this should work because of how the script is read
            if(prereq == 3)
            {
                Objective[0].SetActive(false);
                Objective[1].SetActive(false);
                Objective[2].SetActive(false);
                Objective[3].SetActive(true);
            }
        }

        if(GameManager.Instance.InkController.story.state.VisitCountAtPathString("10105I_TreatingAdda") > 0)
        {
            // Remove "Heal Adda" from objective list
            // Complete[3].SetActive(true);
            Objective[3].SetActive(false);
            // Add "Take Stock" to objective list
            Objective[4].SetActive(true);
            // make the items interactable:
            JankyDialogueFix();
        }

        if((int)GameManager.Instance.InkController.story.variablesState["10106I_stock"] == 5)
        {
            Complete[4].SetActive(true);
            Objective[5].SetActive(true);
        }
    }

    // replace this with something better
    void JankyDialogueFix()
    {
        //make stock items interactable & skip remedy dialogue with the first 2 objects
        DialogueInteractable dialInt0 = StockItem[0].GetComponent<DialogueInteractable>();
        dialInt0.Interactable[1] = true;
        dialInt0.Interacted[0] = true;

        DialogueInteractable dialInt1 = StockItem[1].GetComponent<DialogueInteractable>();
        dialInt1.Interactable[1] = true;
        dialInt1.Interacted[0] = true;

        DialogueInteractable dialInt2 = StockItem[2].GetComponent<DialogueInteractable>();
        dialInt2.Interactable[0] = true;

        DialogueInteractable dialInt3 = StockItem[3].GetComponent<DialogueInteractable>();
        dialInt3.Interactable[0] = true;

        DialogueInteractable dialInt4 = StockItem[4].GetComponent<DialogueInteractable>();
        dialInt4.Interactable[0] = true;

        // set adda and everich inactive if they left. make them uninteractable if not
        if((bool)GameManager.Instance.InkController.story.variablesState["addaDead"])
        {
            Adda.SetActive(false);
            Everich.SetActive(false);
        }
        else
        {
            DialogueInteractable AddaDialInt = Adda.GetComponent<DialogueInteractable>();
            AddaDialInt.Interactable[1] = false;
            DialogueInteractable EverichDialInt = Everich.GetComponent<DialogueInteractable>();
            EverichDialInt.Interactable[0] = false;
        }

    }
    
}
