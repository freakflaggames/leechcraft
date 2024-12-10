using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

public class InGameMenus : MonoBehaviour
{
    public static InGameMenus Instance;
    [SerializeField] GameObject UICanvas;
    [SerializeField] GameObject charSummary;
    [SerializeField] GameObject backgroundObj, remedyCountObj;
    [SerializeField] GameObject[] humorObj;
    [SerializeField] GameObject remedyList;
    [SerializeField] GameObject[] remedy;

    void Awake()
    {
        Instance = this;
    }

    // Start is called before the first frame update
    void Start()
    {
        UpdateUI();
        UICanvas.SetActive(false);

    }

    public void UpdateUI()
    {
        // CHAR SUMMARY
        TextMeshProUGUI bgText = backgroundObj.GetComponent<TextMeshProUGUI>();
        TextMeshProUGUI remedyText = remedyCountObj.GetComponent<TextMeshProUGUI>();
        TextMeshProUGUI bloodText = humorObj[0].GetComponent<TextMeshProUGUI>();
        TextMeshProUGUI yellowBileText = humorObj[1].GetComponent<TextMeshProUGUI>();
        TextMeshProUGUI blackBileText = humorObj[2].GetComponent<TextMeshProUGUI>();
        TextMeshProUGUI phlegmText = humorObj[3].GetComponent<TextMeshProUGUI>();

        // background:
        if((bool)GameManager.Instance.InkController.story.variablesState["physician"])
            bgText.text = "Physician";
        else if((bool)GameManager.Instance.InkController.story.variablesState["apothecary"])
            bgText.text = "Apothecary";
        else if((bool)GameManager.Instance.InkController.story.variablesState["barber"])
            bgText.text = "Barber-Surgeon";
        else if((bool)GameManager.Instance.InkController.story.variablesState["charlatan"])
            bgText.text = "Charlatan";

        // total remedy count:
        int remedyCount = (int)GameManager.Instance.InkController.story.variablesState["totalRemedies"];
        remedyText.text = remedyCount.ToString();
        
        // humor values
        int bloodValue = (int)GameManager.Instance.InkController.story.variablesState["blood"];
        bloodText.text = bloodValue.ToString();
        int yellowBileValue = (int)GameManager.Instance.InkController.story.variablesState["yellowBile"];
        yellowBileText.text = yellowBileValue.ToString();
        int blackBileValue = (int)GameManager.Instance.InkController.story.variablesState["blackBile"];
        blackBileText.text = blackBileValue.ToString();
        int phlegmValue = (int)GameManager.Instance.InkController.story.variablesState["phlegm"];
        phlegmText.text = phlegmValue.ToString();

        // REMEDIES
        bool tisaneCollected = (bool)GameManager.Instance.InkController.story.variablesState["remedyAddaTisane"];
        remedy[0].SetActive(tisaneCollected);
        bool leechesCollected = (bool)GameManager.Instance.InkController.story.variablesState["remedyLeeches"];
        remedy[1].SetActive(leechesCollected);
        bool bloodlettingCollected = (bool)GameManager.Instance.InkController.story.variablesState["remedyBloodletting"];
        remedy[2].SetActive(bloodlettingCollected);
        bool panaceaCollected = (bool)GameManager.Instance.InkController.story.variablesState["remedyUnicornPanacea"];
        remedy[3].SetActive(panaceaCollected);
    }


    public void Next(int page)
    {
        if (page == 0)
        {
            remedyList.SetActive(false);
            charSummary.SetActive(true);
        }
        else if (page == 1)
        {
            UICanvas.SetActive(false);
        }
    }

    public void Back(int page)
    {
        if (page == 0)
        {
            UICanvas.SetActive(false);
        }
        else if (page == 1)
        {
            remedyList.SetActive(true);
            charSummary.SetActive(false);
        }
    }
    
}
