using System.Collections;
using UnityEngine;
#if UNITY_EDITOR
using UnityEditor;
#endif // UNITY_EDITOR

public class SceneManager : MonoBehaviour
{
    public GameObject[] m_scenes;
    public AudioSource m_audio_source;
    Animator m_animator;
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
        m_animator.enabled = false;
        m_current += 1.0f;
    }

    void Start()
    {
        m_animator = GetComponent<Animator>();
        foreach(var s in m_scenes) {
            s.SetActive(false);
        }
        Shader.WarmupAllShaders();
        m_animator.enabled = true;
        m_animator.Play(0);
        m_audio_source.Play();
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

    public void Quit()
    {

#if UNITY_EDITOR
        UnityEditor.EditorApplication.isPlaying = false;
#else
        Application.Quit();
#endif
    }

#if UNITY_EDITOR
    void OnGUI()
    {
        if (GUI.Button(new Rect(5, 5, 150, 25), "next scene"))
        {
            GoNextScene();
        }
    }
#endif
}
