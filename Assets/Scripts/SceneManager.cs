using System.Collections;
using UnityEngine;
#if UNITY_EDITOR
using UnityEditor;
#endif // UNITY_EDITOR

public class SceneManager : MonoBehaviour
{
    public GameObject[] m_scenes;
    public float[] m_timeoffsets;
    public float m_current;
    public float m_time;
    float m_current_prev = -1;

#if UNITY_EDITOR
    void Reset()
    {
    }
#endif // UNITY_EDITOR

    void GoNextScene()
    {
        GetComponent<Animator>().enabled = false;
        m_current += 1.0f;
    }

    void Start()
    {
        foreach(var s in m_scenes) {
            s.SetActive(false);
        }
    }
    
    void Update()
    {
        if ((int)m_current != (int)m_current_prev)
        {
            if ((int)m_current_prev >= 0)
            {
                m_scenes[(int)m_current_prev].SetActive(false);
            }
            m_current = (int)m_current % m_scenes.Length;
            m_time = m_timeoffsets[(int)m_current];
            m_scenes[(int)m_current].SetActive(true);
            m_current_prev = m_current;
            //m_time = 0.0f;
        }

        m_time += Time.deltaTime;
        Shader.SetGlobalFloat("A", m_time);
    }

    void OnGUI()
    {
        if (GUI.Button(new Rect(5, 5, 150, 25), "next scene"))
        {
            GoNextScene();
        }
    }
}
