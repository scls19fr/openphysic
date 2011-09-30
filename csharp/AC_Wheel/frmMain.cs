using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

using Microsoft.DirectX;
using Microsoft.DirectX.DirectInput;



namespace AC_Wheel
{
    /// <summary>
    /// Example Form that uses Managed DirectInput for force feedback
    /// 
    /// By Christopher M. Park -- http://www.christophermpark.com
    /// </summary>
    public partial class frmMain : Form
    {
        enum ThrustmasterWheelButtons
        {
            SHIFT_DOWN, // 0
            SHIFT_UP, // 1
            TURN_LEFT, // 2
            TURN_RIGHT, // 3
            BUTTON5, // 4
            BUTTON6, // 5
            BUTTON7, // 6
            BUTTON8, // 7
            BUTTON9, // 8
            BUTTON10, // 9
        }

        JoystickState[] state;
        double[] F;

        public frmMain()
        {
            InitializeComponent();

            DirectInputWrapper.Initialize( this );

            DirectSoundWrapper.Initialize( this );

        }

        private void btnSendBriefJolt_Click( object sender, EventArgs e )
        {
            this.SendForce( DirectInputWrapper.ForceType.BriefJolt );
        }

        private void btnSendVeryBriefJolt_Click( object sender, EventArgs e )
        {
            this.SendForce( DirectInputWrapper.ForceType.VeryBriefJolt );
        }

        private void btnSendLowRumble_Click( object sender, EventArgs e )
        {
            this.SendForce( DirectInputWrapper.ForceType.LowRumble );
        }

        private void btnSendHardRumble_Click( object sender, EventArgs e )
        {
            this.SendForce( DirectInputWrapper.ForceType.HardRumble );

        }

        private void SendForce( DirectInputWrapper.ForceType Type )
        {
            if ( this.chkPlayer1.Checked )
                DirectInputWrapper.SendForce( Type, true );
            if ( this.chkPlayer2.Checked )
                DirectInputWrapper.SendForce( Type, false );
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            string info = "";


            for (int y = 0; y < DirectInputWrapper.count; y++)
            {
                if (DirectInputWrapper.devices[y] != null)
                {
                    //JoystickState state = DirectInputWrapper.devices[y].CurrentJoystickState;
                    state[y] = DirectInputWrapper.devices[y].CurrentJoystickState;

                    info += "Joystick[" + y.ToString() + "]: ";
                    //Capture les Positions.
                    info += "X:" + state[y].X + " ";
                    info += "Y:" + state[y].Y + " ";
                    info += "Z:" + state[y].Z + " ";
                    //Capture les boutons.
                    byte[] buttons = state[y].GetButtons();
                    for (int i = 0; i < buttons.Length; i++) {
                        if (buttons[i] != 0) {
                            switch (i)
                            {                                
                                case (int) ThrustmasterWheelButtons.SHIFT_DOWN:
                                    info += "SHIFT_DOWN" + " ";
                                    break;
                                case (int) ThrustmasterWheelButtons.SHIFT_UP:
                                    info += "SHIFT_UP" + " ";
                                    //shotsound[1].Play(0, BufferPlayFlags.Default);
                                    break;
                                case (int) ThrustmasterWheelButtons.TURN_LEFT :
                                    info += "TURN_LEFT" + " ";
                                    //shotsound[2].Play(0, BufferPlayFlags.Default);
                                    break;
                                case (int) ThrustmasterWheelButtons.TURN_RIGHT:
                                    info += "TURN_RIGHT" + " ";
                                    //shotsound[3].Play(0, BufferPlayFlags.Default);
                                    break;
                                case (int) ThrustmasterWheelButtons.BUTTON5:
                                    info += "BUTTON5" + " ";
                                    //shotsound[5].
                                    //shotsound[4].Play(0, BufferPlayFlags.Default);
                                    break;
                                case (int) ThrustmasterWheelButtons.BUTTON6:
                                    info += "BUTTON6" + " ";
                                    //shotsound[4].Stop;
                                    //shotsound[5].Play(0, BufferPlayFlags.Default);
                                    break;
                                case (int) ThrustmasterWheelButtons.BUTTON7:
                                    info += "BUTTON7" + " ";
                                    //shotsound[6].Play(0, BufferPlayFlags.Default);
                                    break;
                                case (int) ThrustmasterWheelButtons.BUTTON8:
                                    info += "BUTTON8" + " ";
                                    //shotsound[7].Play(0, BufferPlayFlags.Default);
                                    break;
                                case (int) ThrustmasterWheelButtons.BUTTON9:
                                    info += "BUTTON9" + " ";
                                    //shotsound[8].Play(0, BufferPlayFlags.Default);
                                    break;
                                case (int)ThrustmasterWheelButtons.BUTTON10:
                                    info += "BUTTON10" + " ";
                                    //shotsound[9].Play(0, BufferPlayFlags.Default);
                                    break;
                                default:
                                    info += "UndefButton:" + i + " ";
                                    //shotsound[5].Play(0, BufferPlayFlags.Default);
                                    break;
                            }

                            
                            if (DirectSoundWrapper.shotsound[i] != null)
                            {
                                DirectSoundWrapper.Play(i);
                                //.shotsound[i].Play(0, BufferPlayFlags.Default);
                            }
                            else
                            {
                                info += "no sound ";
                            }

                        }
                    }
                    info += "\r\n";
                }
            }

            // ecart
            double[] D = new double[3];
            D[0]=state[0].X - state[1].X;
            D[1]=state[0].Y - state[1].Y;
            D[2]=state[0].Z - state[1].Z;
            info += "DX:" + D[0]  + " ";
            info += "DY:" + D[1]  + " ";
            info += "DZ:" + D[2]  + " ";
            info += "\r\n";

            // force

            double[] k = new double[3];
            k[0] = k[1] = k[2] = 1.2;
            F[0] = -k[0] * D[0];
            F[1] = -k[1] * D[1];
            F[2] = -k[2] * D[2];
            const double Fmax = 4000;
            if (Math.Abs(F[0]) > Fmax)
            {
                F[0] = F[0] / Math.Abs(F[0]) * Fmax;
            }

            info += "FX:" + F[0] + " ";
            info += "FY:" + F[1] + " ";
            info += "FZ:" + F[2] + " ";
            


            progressBarX0.Value = (state[0].X + 5000) / 100;
            progressBarX1.Value = (state[1].X + 5000) / 100;
            progressBarDX.Value = (int)(((double)state[1].X - (double)state[0].X + 10000.0) / 200.0);

            //DirectInputWrapper.Stretch(F);

            label1.Text = info;

            checkBox1.Checked = !checkBox1.Checked;
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            timerDisplay.Enabled = true;
            //timer1.Tick = 100;

            state = new JoystickState[2];
            F = new double[3];
        }

        private void btnSendStretch_Click(object sender, EventArgs e)
        {
            DirectInputWrapper.Stretch(F);
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void timerFF_Tick(object sender, EventArgs e)
        {
            //Console.WriteLine("Timer ForceFeeback");
            DirectInputWrapper.Stretch(F);
        }



    }
}
