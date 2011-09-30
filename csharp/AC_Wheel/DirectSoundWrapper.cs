using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Microsoft.DirectX.DirectSound;
using DS = Microsoft.DirectX.DirectSound;

namespace AC_Wheel
{
    public sealed class DirectSoundWrapper
    {

        private static DS.Device sounddevice;
        public static SecondaryBuffer[] shotsound;
        private static BufferDescription description;

        public static void Initialize(System.Windows.Forms.Control Parent)
        {
            // Initialize sound
            sounddevice = new DS.Device();
            sounddevice.SetCooperativeLevel(Parent, CooperativeLevel.Normal);

            //BufferDescription description = new BufferDescription();
            description = new BufferDescription();
            description.ControlEffects = false;

            shotsound = new SecondaryBuffer[10];
            //shotsound[0]
            //    = new SecondaryBuffer("turn-left.wav", description, sounddevice);
            //shotsound[1]
            //    = new SecondaryBuffer("turn-left.wav", description, sounddevice);
            shotsound[2]
                = new SecondaryBuffer("turn-left.wav", description, sounddevice);
            shotsound[3]
                = new SecondaryBuffer("turn-right.wav", description, sounddevice);
            shotsound[4]
                = new SecondaryBuffer("horn.wav", description, sounddevice);
            shotsound[5]
                = new SecondaryBuffer("ignition.wav", description, sounddevice);
            shotsound[6]
                = new SecondaryBuffer("police_siren.wav", description, sounddevice);
            shotsound[7]
                = new SecondaryBuffer("ambulance_siren.wav", description, sounddevice);
            //shotsound[8]
            //    = new SecondaryBuffer("ignition.wav", description, sounddevice);
            //shotsound[9]
            //    = new SecondaryBuffer("ignition.wav", description, sounddevice);

            //shotsound = new SecondaryBuffer("horn.wav", description, sounddevice);
            //shotsound.Play(0, BufferPlayFlags.Default);

        }

        public static void Play(int i)
        {
            shotsound[i].Play(0, BufferPlayFlags.Default);
        }
    }
}
