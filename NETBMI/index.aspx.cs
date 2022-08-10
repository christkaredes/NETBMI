// Christ Karedes
// Assgn 4: BMI Calculator (ASP.NET)
// Submitted: 5/19/19

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NETBMI
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        // Everything occurs under the button event
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                double _inchesVal = 0;
                double _feetVal = 0;
                double _heightVal = 0;
                double _weightVal = 0;
                double _bmiVal = 0;

                double.TryParse(drpInches.SelectedValue, out _inchesVal);
                double.TryParse(drpFeet.SelectedValue, out _feetVal);

                // I wanted to create a CustomValidator for two controls, but I couldn't figure it out :(
                if (_inchesVal == 0 && _feetVal == 0)
                {
                    lblFinalBMITitle.Visible = false;
                    lblFinalBMI.Visible = false;
                    lblHeightValidate.Visible = true;
                    unknown.Visible = true;
                    obese.Visible = false;
                    overweight.Visible = false;
                    healthy.Visible = false;
                    underweight.Visible = false;
                    return;
                }
                else
                {
                    lblHeightValidate.Visible = false;
                    lblFinalBMI.Visible = false;
                    lblFinalBMITitle.Visible = true;
                }
                // If the weight is anything but a number, then the user cannot proceed.
                if (!double.TryParse(txtWeight.Text, out _weightVal))
                {
                    lblFinalBMITitle.Visible = false;
                    lblFinalBMI.Visible = false;
                    unknown.Visible = true;
                    obese.Visible = false;
                    overweight.Visible = false;
                    healthy.Visible = false;
                    underweight.Visible = false;
                    return;
                }
                else
                {
                    lblHeightValidate.Visible = false;
                    lblFinalBMI.Visible = true;
                    lblFinalBMITitle.Visible = true;
                }

                _heightVal = (_feetVal * 12) + _inchesVal;
                _bmiVal = (_weightVal / (_heightVal * _heightVal) * 703);

                // A picture is shown under the right condition
                if (_bmiVal >= 30) // Obese conditions
                {
                    obese.Visible = true;
                    unknown.Visible = false;
                    overweight.Visible = false;
                    healthy.Visible = false;
                    underweight.Visible = false;
                }
                else if (_bmiVal >= 25) // Overweight conditions
                {
                    overweight.Visible = true;
                    unknown.Visible = false;
                    obese.Visible = false;
                    healthy.Visible = false;
                    underweight.Visible = false;
                }
                else if (_bmiVal >= 18.5) // Healthy conditions
                {
                    healthy.Visible = true;
                    unknown.Visible = false;
                    obese.Visible = false;
                    overweight.Visible = false;
                    underweight.Visible = false;
                }
                else // Underweight conditions
                {
                    underweight.Visible = true;
                    unknown.Visible = false;
                    obese.Visible = false;
                    overweight.Visible = false;
                    healthy.Visible = false;
                }
                lblFinalBMI.Text = Convert.ToString(Math.Round(_bmiVal, 2)); // Rounds the BMI two decimal places over
            }
        }   
    }
}